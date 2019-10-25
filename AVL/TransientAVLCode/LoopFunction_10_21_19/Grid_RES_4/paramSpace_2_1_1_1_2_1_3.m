function [aeroForces] = paramSpace_2_1_1_1_2_1_3(sailStates,airStates)

	CL = (6.103446)*sailStates.alpha + (-0.636213)*sailStates.beta + (-3.489310)*sailStates.p + (44.554947)*sailStates.q + (-2.684344)*sailStates.r + (0.011824)*sailStates.de;
	CD = -2.386550;
	CY = (-0.405531)*sailStates.alpha + (-0.025093)*sailStates.beta + (-1.183555)*sailStates.p + (0.221996)*sailStates.q + (-0.077598)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (2.071075)*sailStates.alpha + (0.396934)*sailStates.beta + (-1.988514)*sailStates.p + (17.725998)*sailStates.q + (-2.440906)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-12.331248)*sailStates.alpha + (2.545459)*sailStates.beta + (11.143937)*sailStates.p + (-160.446365)*sailStates.q + (9.130902)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (1.549269)*sailStates.alpha + (0.040916)*sailStates.beta + (2.515181)*sailStates.p + (-10.978683)*sailStates.q + (0.013065)*sailStates.r + (-0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end