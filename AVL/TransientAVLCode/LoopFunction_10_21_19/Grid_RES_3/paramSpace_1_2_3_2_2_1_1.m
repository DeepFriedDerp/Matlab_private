function [aeroForces] = paramSpace_1_2_3_2_2_1_1(sailStates,airStates)

	CL = (4.530792)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.181587)*sailStates.p + (35.098831)*sailStates.q + (-1.750270)*sailStates.r + (0.011304)*sailStates.de;
	CD = -0.476670;
	CY = (0.067837)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.606844)*sailStates.p + (-0.267957)*sailStates.q + (-0.107028)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (1.177201)*sailStates.alpha + (0.314113)*sailStates.beta + (-0.876399)*sailStates.p + (7.672434)*sailStates.q + (-1.407103)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-12.707202)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.459208)*sailStates.p + (-124.628265)*sailStates.q + (5.816761)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (-0.488382)*sailStates.alpha + (0.055387)*sailStates.beta + (1.279924)*sailStates.p + (-5.324490)*sailStates.q + (0.004674)*sailStates.r + (-0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end