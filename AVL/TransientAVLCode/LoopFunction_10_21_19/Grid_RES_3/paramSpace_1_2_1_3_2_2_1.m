function [aeroForces] = paramSpace_1_2_1_3_2_2_1(sailStates,airStates)

	CL = (3.853737)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.249053)*sailStates.p + (33.169861)*sailStates.q + (-0.801413)*sailStates.r + (0.010525)*sailStates.de;
	CD = 0.075450;
	CY = (-0.000827)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.190027)*sailStates.p + (-0.173374)*sailStates.q + (-0.033490)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.082737)*sailStates.alpha + (0.101928)*sailStates.beta + (-0.966932)*sailStates.p + (7.911164)*sailStates.q + (-0.562022)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-13.657865)*sailStates.alpha + (0.000000)*sailStates.beta + (7.481958)*sailStates.p + (-128.476028)*sailStates.q + (2.727484)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (0.021917)*sailStates.alpha + (0.017973)*sailStates.beta + (0.281972)*sailStates.p + (-0.578627)*sailStates.q + (-0.019553)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end