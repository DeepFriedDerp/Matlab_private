function [aeroForces] = paramSpace_1_3_4_3_1_1_1(sailStates,airStates)

	CL = (4.094823)*sailStates.alpha + (0.099069)*sailStates.beta + (-2.294848)*sailStates.p + (35.321217)*sailStates.q + (-1.409082)*sailStates.r + (0.011108)*sailStates.de;
	CD = -0.128470;
	CY = (-0.045927)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.394362)*sailStates.p + (-0.684401)*sailStates.q + (-0.078517)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.047454)*sailStates.alpha + (0.253594)*sailStates.beta + (-0.966820)*sailStates.p + (8.312737)*sailStates.q + (-1.067101)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-12.947479)*sailStates.alpha + (-0.342690)*sailStates.beta + (7.111127)*sailStates.p + (-128.521423)*sailStates.q + (4.677899)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.108493)*sailStates.alpha + (0.045127)*sailStates.beta + (0.780800)*sailStates.p + (-2.630120)*sailStates.q + (-0.018847)*sailStates.r + (0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end