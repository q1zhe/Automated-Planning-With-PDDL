(define (domain wumpus_domain_a)

  (:predicates
   (adj ?square-1 ?square-2)    ;; Adjacency between squares
   (pit ?square)                ;; Pit is present
   (at ?what ?square)           ;; Location of agent/items/Wumpus
   (have ?who ?what)            ;; Inventory: agent has item
   (agent ?who)                 ;; Declares what is an agent
   (gold ?item)                 ;; Marks item as gold
   (key ?item)                  ;; Marks item as a key
   (unlocked ?what)             ;; Marks if gold is unlocked
   (dead ?who))                 ;; Marks the Wumpus as dead

  (:action move
  :parameters (?who ?from ?to)
  :precondition (and
    (agent ?who)            ;; Only agents can move
    (adj ?from ?to)
    (not (pit ?to))         ;; Cannot move into pit
    (not (and (at wumpus ?to) (not (dead wumpus)))) ;; Cannot move into Wumpus if it's alive
    (at ?who ?from))
  :effect (and
    (not (at ?who ?from))
    (at ?who ?to))
  )

  (:action take
    :parameters (?who ?what ?where)
    :precondition (and 
               (at ?who ?where)
		       (at ?what ?where)
		       (or (key ?what)                            ;;agent is only allowed to take an object ?what if:
                    (and (gold ?what) (unlocked ?what)))) ;;?what is a key or gold if it has been unlocked.
    :effect (and (have ?who ?what)
		 (not (at ?what ?where)))
    )
    
    ;; additional 'unlock' action to use for added constraint, uses key to unlock gold
    (:action unlock
    :parameters (?who ?key ?gold ?where)
    :precondition (and
      (at ?who ?where)
      (at ?gold ?where)
      (have ?who ?key)
      (gold ?gold)
      (key ?key))
    :effect (unlocked ?gold) ;; Gold is now unlocked as effect of action
   )

   (:action shoot
    :parameters (?who ?where ?arrow ?victim ?where-victim)
    :precondition (and 
      (have ?who ?arrow)
      (at ?who ?where)
      (at ?victim ?where-victim)
      (adj ?where ?where-victim))   ;; Agent and victim must be adjacent
    :effect (and
      (dead ?victim)
      (not (at ?victim ?where-victim))
      (not (have ?who ?arrow)))
   )
)