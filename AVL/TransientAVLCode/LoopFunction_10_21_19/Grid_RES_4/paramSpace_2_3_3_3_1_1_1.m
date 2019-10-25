function [aeroForces] = paramSpace_2_3_3_3_1_1_1(sailStates,airStates)

	CL = (4.189468)*sailStates.alpha + (0.062918)*sailStates.beta + (-2.328576)*sailStates.p + (33.605709)*sailStates.q + (-0.817573)*sailStates.r + (0.011091)*sailStates.de;
	CD = -0.136410;
	CY = (-0.040529)*sailStates.alpha + (-0.025157)*sailStates.beta + (-0.285394)*sailStates.p + (-0.563442)*sailStates.q + (-0.018726)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.087691)*sailStates.alpha + (0.182711)*sailStates.beta + (-0.987692)*sailStates.p + (7.809056)*sailStates.q + (-0.692085)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-14.271700)*sailStates.alpha + (-0.235207)*sailStates.beta + (7.801679)*sailStates.p + (-130.282166)*sailStates.q + (2.769303)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.137281)*sailStates.alpha + (0.010817)*sailStates.beta + (0.611073)*sailStates.p + (-2.249218)*sailStates.q + (-0.001060)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end