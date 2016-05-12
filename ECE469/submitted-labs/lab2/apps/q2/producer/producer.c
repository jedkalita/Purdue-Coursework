#include "lab2-api.h"
#include "usertraps.h"
#include "misc.h"
//#include <stdio.h>
#include "prod_cons.h"

void main (int argc, char *argv[])
{
  prod_cons *pc;        // Used to access missile codes in shared memory page
  uint32 h_mem;            // Handle to the shared memory page
  sem_t s_procs_completed; // Semaphore to signal the original process that we're done 
  lock_t lock_handler; //handle to the shared lock
  int name;
  char * str;
  //char *str = "Hello world";
  //str = "Hello world";
  //char str[12] = "Hello world";
  int total_chars_put = 0;
  int lr_val;
  str = "Hello world";

  if (argc != 4) { 
    Printf("Usage: "); 
    Printf(argv[0]); 
    Printf(" <handle_to_shared_memory_page> <handle_to_page_mapped_semaphore>\n"); 
    Exit();
  } 

  // Convert the command-line strings into integers for use as handles
  h_mem = dstrtol(argv[1], NULL, 10); // The "10" means base 10
  s_procs_completed = dstrtol(argv[2], NULL, 10);
  lock_handler = dstrtol(argv[3], NULL, 10); //lock integer handler

  // Map shared memory page into this process's memory space
  if ((pc = (prod_cons *)shmat(h_mem)) == NULL) {
    Printf("Could not map the virtual address to the memory in "); 
    Printf(argv[0]); 
    Printf(", exiting...\n");
    Exit();
    }
  
  while (total_chars_put < 11) {
    if (lock_acquire(lock_handler) != SYNC_FAIL){//successfully acquired the lock
      //if ( ( (pc->head + 1) % 20) != pc->tail) {//essentially the buffer is not full
      //acquire the lock
      //if (lock_acquire(lock_handler) != SYNC_FAIL){//successfully acquired the lock
      if ( ( (pc->head + 1) % BUFFERSIZE) != pc->tail) {//essentially the buffer is not full
	//put the character in the buffer
	pc->buffer[pc->head] = str[total_chars_put++];
	pc->head = (pc->head + 1) % BUFFERSIZE;
	//lock_release(lock_handler);
	Printf("Producer %d inserted: %c\n", getpid(), str[total_chars_put - 1]);
	//Printf("\nProducer %d just finished producing %d items.", getpid(), total_chars_put);
      }
      /*else {
	lock_release(lock_handler);
	}*/
      
      lr_val = lock_release(lock_handler);
      if (lr_val == SYNC_FAIL) {
	Printf("\nLOCK IS NOT GETTING RELEASED IN THE MIDDLE OF A PROD.");
      }
    }
  }
	
  //Printf("\nProducer %d produced %d items.", getpid(), total_chars_put);
  // Signal the semaphore to tell the original process that we're done
  if(sem_signal(s_procs_completed) != SYNC_SUCCESS) {
    Printf("Bad semaphore s_procs_completed (%d) in ", s_procs_completed); Printf(argv[0]); Printf(", exiting...\n");
    Exit();
    }
}
  
      
      