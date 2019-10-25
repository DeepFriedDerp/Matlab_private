function [aeroForces] = paramSpace_3_2_3_1_1_3_1(sailStates,airStates)

	CL = (7.340312)*sailStates.alpha + (0.215165)*sailStates.beta + (-1.722813)*sailStates.p + (30.562069)*sailStates.q + (2.885513)*sailStates.r + (0.011160)*sailStates.de;
	CD = -2.966530;
	CY = (-0.701164)*sailStates.alpha + (-0.025553)*sailStates.beta + (1.370861)*sailStates.p + (-1.471501)*sailStates.q + (-0.089903)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (2.249934)*sailStates.alpha + (-0.563707)*sailStates.beta + (-0.509340)*sailStates.p + (4.014184)*sailStates.q + (2.586903)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-14.010181)*sailStates.alpha + (-0.838116)*sailStates.beta + (5.113774)*sailStates.p + (-112.102478)*sailStates.q + (-9.770897)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (2.627762)*sailStates.alpha + (0.042990)*sailStates.beta + (-3.005248)*sailStates.p + (14.680060)*sailStates.q + (0.029624)*sailStates.r + (0.000621)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end