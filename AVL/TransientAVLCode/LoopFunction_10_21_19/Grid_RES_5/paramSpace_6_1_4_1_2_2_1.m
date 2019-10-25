function [aeroForces] = paramSpace_6_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.431696)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.011786)*sailStates.p + (29.267803)*sailStates.q + (0.754081)*sailStates.r + (0.010539)*sailStates.de;
	CD = -0.561430;
	CY = (0.015069)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.411157)*sailStates.p + (0.839975)*sailStates.q + (0.028840)*sailStates.r + (0.000180)*sailStates.de;

	Cl = (0.899130)*sailStates.alpha + (-0.239522)*sailStates.beta + (-0.774133)*sailStates.p + (5.514446)*sailStates.q + (0.840301)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.790771)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.242059)*sailStates.p + (-122.784714)*sailStates.q + (-2.592547)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (0.505947)*sailStates.alpha + (-0.016749)*sailStates.beta + (-0.975646)*sailStates.p + (3.788685)*sailStates.q + (-0.006140)*sailStates.r + (-0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end