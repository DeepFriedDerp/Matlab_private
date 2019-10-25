function [aeroForces] = paramSpace_3_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.275723)*sailStates.alpha + (-0.148973)*sailStates.beta + (-2.513171)*sailStates.p + (33.529472)*sailStates.q + (-0.481485)*sailStates.r + (0.010646)*sailStates.de;
	CD = -0.322630;
	CY = (-0.093622)*sailStates.alpha + (-0.025526)*sailStates.beta + (-0.284838)*sailStates.p + (-0.769435)*sailStates.q + (0.018696)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.293388)*sailStates.alpha + (0.140939)*sailStates.beta + (-1.234605)*sailStates.p + (10.010617)*sailStates.q + (-0.561752)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.731220)*sailStates.alpha + (0.645387)*sailStates.beta + (8.827489)*sailStates.p + (-135.788696)*sailStates.q + (1.652898)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.082146)*sailStates.alpha + (-0.012199)*sailStates.beta + (0.728417)*sailStates.p + (-2.951869)*sailStates.q + (-0.005706)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end