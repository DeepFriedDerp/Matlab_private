function [aeroForces] = paramSpace_6_1_4_2_2_2_2(sailStates,airStates)

	CL = (4.129888)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.762591)*sailStates.p + (36.054501)*sailStates.q + (0.057860)*sailStates.r + (0.011070)*sailStates.de;
	CD = -0.067310;
	CY = (0.068484)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.120089)*sailStates.p + (0.466416)*sailStates.q + (0.008447)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.330424)*sailStates.alpha + (-0.078892)*sailStates.beta + (-1.375901)*sailStates.p + (11.246151)*sailStates.q + (0.182786)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.911060)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.551105)*sailStates.p + (-142.955811)*sailStates.q + (-0.235183)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (0.021116)*sailStates.alpha + (-0.005517)*sailStates.beta + (-0.351591)*sailStates.p + (1.422744)*sailStates.q + (-0.005457)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end