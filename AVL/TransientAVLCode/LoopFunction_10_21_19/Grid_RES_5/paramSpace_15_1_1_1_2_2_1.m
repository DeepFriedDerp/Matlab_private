function [aeroForces] = paramSpace_15_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.397261)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.105913)*sailStates.p + (36.671242)*sailStates.q + (2.031413)*sailStates.r + (0.011451)*sailStates.de;
	CD = -0.581700;
	CY = (0.059680)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.616131)*sailStates.p + (1.423509)*sailStates.q + (-0.153773)*sailStates.r + (0.000296)*sailStates.de;

	Cl = (0.877217)*sailStates.alpha + (-0.364030)*sailStates.beta + (-0.801719)*sailStates.p + (7.524611)*sailStates.q + (1.613048)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-10.644728)*sailStates.alpha + (0.000000)*sailStates.beta + (5.673907)*sailStates.p + (-121.603668)*sailStates.q + (-6.662491)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (0.471276)*sailStates.alpha + (0.090763)*sailStates.beta + (-1.326487)*sailStates.p + (4.524537)*sailStates.q + (-0.021610)*sailStates.r + (-0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end