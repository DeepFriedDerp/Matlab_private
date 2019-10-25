function [aeroForces] = paramSpace_3_4_2_3_2_2_3(sailStates,airStates)

	CL = (3.968358)*sailStates.alpha + (-0.063020)*sailStates.beta + (-2.807495)*sailStates.p + (36.803020)*sailStates.q + (0.360596)*sailStates.r + (0.011016)*sailStates.de;
	CD = 0.029250;
	CY = (0.000329)*sailStates.alpha + (-0.024723)*sailStates.beta + (0.078130)*sailStates.p + (-0.065300)*sailStates.q + (-0.005119)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.258763)*sailStates.alpha + (-0.059634)*sailStates.beta + (-1.362644)*sailStates.p + (11.080153)*sailStates.q + (0.239661)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.372305)*sailStates.alpha + (0.198174)*sailStates.beta + (9.560460)*sailStates.p + (-143.297119)*sailStates.q + (-1.209741)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.062604)*sailStates.alpha + (0.002719)*sailStates.beta + (-0.100910)*sailStates.p + (0.281757)*sailStates.q + (-0.003276)*sailStates.r + (0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end