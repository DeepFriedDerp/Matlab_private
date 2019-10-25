function [aeroForces] = paramSpace_3_4_3_3_3_1_3(sailStates,airStates)

	CL = (4.184248)*sailStates.alpha + (0.085615)*sailStates.beta + (-2.795215)*sailStates.p + (36.011166)*sailStates.q + (-0.412945)*sailStates.r + (0.010830)*sailStates.de;
	CD = -0.188090;
	CY = (0.020623)*sailStates.alpha + (-0.025294)*sailStates.beta + (-0.295806)*sailStates.p + (0.432842)*sailStates.q + (0.019403)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.355581)*sailStates.alpha + (0.155966)*sailStates.beta + (-1.360252)*sailStates.p + (10.866034)*sailStates.q + (-0.453162)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.714673)*sailStates.alpha + (-0.323278)*sailStates.beta + (9.759151)*sailStates.p + (-143.531296)*sailStates.q + (1.383536)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.123717)*sailStates.alpha + (-0.006279)*sailStates.beta + (0.734746)*sailStates.p + (-3.970856)*sailStates.q + (-0.012655)*sailStates.r + (-0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end