function [aeroForces] = paramSpace_2_1_3_1_1_3_2(sailStates,airStates)

	CL = (7.234033)*sailStates.alpha + (0.520913)*sailStates.beta + (-2.506312)*sailStates.p + (31.941927)*sailStates.q + (2.337748)*sailStates.r + (0.010359)*sailStates.de;
	CD = -2.828440;
	CY = (-0.194431)*sailStates.alpha + (-0.023158)*sailStates.beta + (1.256180)*sailStates.p + (-1.693495)*sailStates.q + (0.082275)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (2.753360)*sailStates.alpha + (-0.402628)*sailStates.beta + (-1.240021)*sailStates.p + (9.584358)*sailStates.q + (2.222142)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-17.166498)*sailStates.alpha + (-2.059292)*sailStates.beta + (9.379715)*sailStates.p + (-136.946671)*sailStates.q + (-7.912060)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.687516)*sailStates.alpha + (-0.042275)*sailStates.beta + (-2.833067)*sailStates.p + (14.329220)*sailStates.q + (-0.034691)*sailStates.r + (0.000713)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end