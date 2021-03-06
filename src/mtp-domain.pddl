(define (domain no_running_1)
	(:requirements :typing)
	(:types 
		 cell
	)
	(:constants 
		c0 c1 c2 - cell
	)
	(:predicates
		(at ?c - cell)
		(adj ?o - cell ?d - cell)
		(broken)
		(scratch)
		(end)
		(act)
		(l_d3)
		(e_d3)
		(eff_d3_walk)
		(eff_d3_run)
		(l_d2)
		(e_d2)
		(eff_d2_walk)
		(eff_d2_run)
		(l_d1)
		(e_d1)
		(eff_d1_walk)
		(eff_d1_run)
		(u_walk)
		(u_run)
	)
	(:action continue_d3 
		:parameters ()
		:precondition (and  (not (act)) (l_d3) (not (eff_d3_walk)) (not (eff_d3_run)) (not (eff_d2_walk)) (not (eff_d2_run)) (not (eff_d1_walk)) (not (eff_d1_run)) (or (e_d3)))
		:effect (and (act) (not (e_d3)) (not (e_d2)) (not (e_d1)))
	)
	(:action continue_d2 
		:parameters ()
		:precondition (and  (not (act)) (l_d2) (not (eff_d3_walk)) (not (eff_d3_run)) (not (eff_d2_walk)) (not (eff_d2_run)) (not (eff_d1_walk)) (not (eff_d1_run)) (or (e_d3) (e_d2)))
		:effect (and (act) (not (e_d3)) (not (e_d2)) (not (e_d1)))
	)
	(:action continue_d1 
		:parameters ()
		:precondition (and  (not (act)) (l_d1) (not (eff_d3_walk)) (not (eff_d3_run)) (not (eff_d2_walk)) (not (eff_d2_run)) (not (eff_d1_walk)) (not (eff_d1_run)) (or (e_d3) (e_d2) (e_d1)))
		:effect (and (act) (not (e_d3)) (not (e_d2)) (not (e_d1)))
	)
	(:action degrade_d3_d2 
		:parameters ()
		:precondition (and  (not (act)) (l_d3) (e_d2) (not (eff_d3_walk)) (not (eff_d3_run)) (not (eff_d2_walk)) (not (eff_d2_run)) (not (eff_d1_walk)) (not (eff_d1_run)))
		:effect (and (act) (l_d2) (not (l_d3)) (not (e_d3)) (not (e_d2)) (not (e_d1)))
	)
	(:action degrade_d3_d1 
		:parameters ()
		:precondition (and  (not (act)) (l_d3) (e_d1) (not (eff_d3_walk)) (not (eff_d3_run)) (not (eff_d2_walk)) (not (eff_d2_run)) (not (eff_d1_walk)) (not (eff_d1_run)))
		:effect (and (act) (l_d1) (not (l_d3)) (not (e_d3)) (not (e_d2)) (not (e_d1)))
	)
	(:action degrade_d2_d1 
		:parameters ()
		:precondition (and  (not (act)) (l_d2) (e_d1) (not (eff_d3_walk)) (not (eff_d3_run)) (not (eff_d2_walk)) (not (eff_d2_run)) (not (eff_d1_walk)) (not (eff_d1_run)))
		:effect (and (act) (l_d1) (not (l_d2)) (not (e_d3)) (not (e_d2)) (not (e_d1)))
	)
	(:action walk_unfair_ 
		:parameters ()
		:precondition (and  (act) (u_walk))
		:effect (oneof (and (eff_d3_walk) (not (act))) (and (eff_d2_walk) (not (act))) (and (eff_d1_walk) (not (act))))
	)
	(:action walk_d3 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (l_d3) (act) (not (u_walk)) (not (u_run)))
		:effect (oneof (and (not (at ?o)) (at ?d)) (u_walk))
	)
	(:action walk_d2 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (l_d2) (act) (not (u_walk)) (not (u_run)))
		:effect (oneof (and (not (at ?o)) (at ?d)) (and (not (at ?o)) (at ?d) (scratch)) (u_walk))
	)
	(:action walk_d1 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (l_d1) (act) (not (u_walk)) (not (u_run)))
		:effect (oneof (and (not (at ?o)) (at ?d)) (and (not (at ?o)) (at ?d) (scratch)) (scratch))
	)
	(:action walk_eff_d3_explained_by_d3 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (eff_d3_walk))
		:effect (and (not (at ?o)) (at ?d) (e_d3) (not (eff_d3_walk)) (not (act)) (not (u_walk)))
	)
	(:action walk_eff_d2_explained_by_d3 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (eff_d2_walk) (scratch))
		:effect (and (not (at ?o)) (at ?d) (scratch) (e_d3) (not (eff_d2_walk)) (not (act)) (not (u_walk)))
	)
	(:action walk_eff_d2_explained_by_d2 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (eff_d2_walk) (or (not (scratch))))
		:effect (and (not (at ?o)) (at ?d) (scratch) (e_d2) (not (eff_d2_walk)) (not (act)) (not (u_walk)))
	)
	(:action walk_eff_d1_explained_by_d3 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (eff_d1_walk) (scratch) (not (at ?o)) (at ?d))
		:effect (and (scratch) (e_d3) (not (eff_d1_walk)) (not (act)) (not (u_walk)))
	)
	(:action walk_eff_d1_explained_by_d2 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (eff_d1_walk) (not (at ?o)) (at ?d) (or (not (scratch)) (at ?o) (not (at ?d))))
		:effect (and (scratch) (e_d2) (not (eff_d1_walk)) (not (act)) (not (u_walk)))
	)
	(:action walk_eff_d1_explained_by_d1 
		:parameters (?o - cell ?d - cell)
		:precondition (and  (at ?o) (adj ?o ?d) (not (broken)) (eff_d1_walk) (or (not (scratch)) (at ?o) (not (at ?d))) (or (at ?o) (not (at ?d))))
		:effect (and (scratch) (e_d1) (not (eff_d1_walk)) (not (act)) (not (u_walk)))
	)
	(:action run_unfair_ 
		:parameters ()
		:precondition (and  (act) (u_run))
		:effect (oneof (and (eff_d3_run) (not (act))) (and (eff_d2_run) (not (act))) (and (eff_d1_run) (not (act))))
	)
	(:action run_d3 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (l_d3) (act) (not (u_walk)) (not (u_run)))
		:effect (oneof (and (not (at c2)) (at c0)) (u_run))
	)
	(:action run_d2 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (l_d2) (act) (not (u_walk)) (not (u_run)))
		:effect (oneof (and (not (at c2)) (at c0)) (and (not (at c2)) (at c0) (scratch)) (u_run))
	)
	(:action run_d1 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (l_d1) (act) (not (u_walk)) (not (u_run)))
		:effect (oneof (and (not (at c2)) (at c0)) (and (not (at c2)) (at c0) (scratch)) (broken))
	)
	(:action run_eff_d3_explained_by_d3 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (eff_d3_run))
		:effect (and (not (at c2)) (at c0) (e_d3) (not (eff_d3_run)) (not (act)) (not (u_run)))
	)
	(:action run_eff_d2_explained_by_d3 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (eff_d2_run) (scratch))
		:effect (and (not (at c2)) (at c0) (scratch) (e_d3) (not (eff_d2_run)) (not (act)) (not (u_run)))
	)
	(:action run_eff_d2_explained_by_d2 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (eff_d2_run) (or (not (scratch))))
		:effect (and (not (at c2)) (at c0) (scratch) (e_d2) (not (eff_d2_run)) (not (act)) (not (u_run)))
	)
	(:action run_eff_d1_explained_by_d3 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (eff_d1_run) (broken) (not (at c2)) (at c0))
		:effect (and (broken) (e_d3) (not (eff_d1_run)) (not (act)) (not (u_run)))
	)
	(:action run_eff_d1_explained_by_d2 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (eff_d1_run) (broken) (not (at c2)) (at c0) (scratch) (or (not (broken)) (at c2) (not (at c0))))
		:effect (and (broken) (e_d2) (not (eff_d1_run)) (not (act)) (not (u_run)))
	)
	(:action run_eff_d1_explained_by_d1 
		:parameters ()
		:precondition (and  (at c2) (not (broken)) (eff_d1_run) (or (not (broken)) (at c2) (not (at c0))) (or (not (broken)) (at c2) (not (at c0)) (not (scratch))))
		:effect (and (broken) (e_d1) (not (eff_d1_run)) (not (act)) (not (u_run)))
	)
	(:action check_goal_d3 
		:parameters ()
		:precondition (and  (at c0) (not (scratch)) (not (broken)) (l_d3) (act))
		:effect (end)
	)
	(:action check_goal_d2 
		:parameters ()
		:precondition (and  (at c0) (not (broken)) (l_d2) (act))
		:effect (end)
	)
	(:action check_goal_d1 
		:parameters ()
		:precondition (and  (at c2) (l_d1) (act) (not (broken)))
		:effect (end)
	)
)
