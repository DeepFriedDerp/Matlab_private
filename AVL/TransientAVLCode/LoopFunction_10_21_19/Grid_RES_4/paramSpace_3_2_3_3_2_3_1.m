function [aeroForces] = paramSpace_3_2_3_3_2_3_1(sailStates,airStates)

	CL = (4.271015)*sailStates.alpha + (0.076155)*sailStates.beta + (-2.323341)*sailStates.p + (33.649727)*sailStates.q + (0.956059)*sailStates.r + (0.011060)*sailStates.de;
	CD = -0.188600;
	CY = (-0.032846)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.380836)*sailStates.p + (0.065300)*sailStates.q + (-0.024959)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.212315)*sailStates.alpha + (-0.172380)*sailStates.beta + (-1.017107)*sailStates.p + (8.222401)*sailStates.q + (0.824253)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.284849)*sailStates.alpha + (-0.301427)*sailStates.beta + (7.741342)*sailStates.p + (-130.047943)*sailStates.q + (-3.251747)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.234285)*sailStates.alpha + (0.012874)*sailStates.beta + (-0.796335)*sailStates.p + (3.352921)*sailStates.q + (0.002497)*sailStates.r + (0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end