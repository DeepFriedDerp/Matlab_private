function [aeroForces] = paramSpace_1_1_1_2_1_2_1(sailStates,airStates)

	CL = (5.410168)*sailStates.alpha + (-0.067690)*sailStates.beta + (-2.464926)*sailStates.p + (33.396015)*sailStates.q + (-1.195438)*sailStates.r + (0.009912)*sailStates.de;
	CD = -0.603100;
	CY = (1.086962)*sailStates.alpha + (-0.045031)*sailStates.beta + (-0.739405)*sailStates.p + (8.654559)*sailStates.q + (-0.097958)*sailStates.r + (0.001837)*sailStates.de;

	Cl = (2.071664)*sailStates.alpha + (-0.058994)*sailStates.beta + (-1.268081)*sailStates.p + (11.188860)*sailStates.q + (-0.715451)*sailStates.r + (0.000357)*sailStates.de;
	Cm = (-17.134596)*sailStates.alpha + (0.117455)*sailStates.beta + (7.971015)*sailStates.p + (-133.043594)*sailStates.q + (3.927714)*sailStates.r + (-0.067896)*sailStates.de;
	Cn = (-0.992980)*sailStates.alpha + (0.023130)*sailStates.beta + (1.241987)*sailStates.p + (-11.398902)*sailStates.q + (0.092142)*sailStates.r + (-0.002526)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end