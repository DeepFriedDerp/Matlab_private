function [aeroForces] = paramSpace_3_1_3_2_1_3_1(sailStates,airStates)

	CL = (4.724505)*sailStates.alpha + (0.335718)*sailStates.beta + (-2.163408)*sailStates.p + (32.702557)*sailStates.q + (1.492346)*sailStates.r + (0.010912)*sailStates.de;
	CD = -0.610490;
	CY = (-0.197237)*sailStates.alpha + (-0.025570)*sailStates.beta + (0.667335)*sailStates.p + (-0.668510)*sailStates.q + (-0.043763)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.447133)*sailStates.alpha + (-0.207856)*sailStates.beta + (-0.922589)*sailStates.p + (7.600202)*sailStates.q + (1.307134)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.083143)*sailStates.alpha + (-1.311960)*sailStates.beta + (7.033268)*sailStates.p + (-124.743294)*sailStates.q + (-5.059544)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.666336)*sailStates.alpha + (0.022409)*sailStates.beta + (-1.422943)*sailStates.p + (6.762127)*sailStates.q + (0.011545)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end