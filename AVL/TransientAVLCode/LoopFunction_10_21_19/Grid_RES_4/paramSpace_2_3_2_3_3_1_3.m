function [aeroForces] = paramSpace_2_3_2_3_3_1_3(sailStates,airStates)

	CL = (4.376069)*sailStates.alpha + (0.085359)*sailStates.beta + (-2.838772)*sailStates.p + (37.894123)*sailStates.q + (-1.154892)*sailStates.r + (0.011311)*sailStates.de;
	CD = -0.249970;
	CY = (0.019950)*sailStates.alpha + (-0.024755)*sailStates.beta + (-0.482553)*sailStates.p + (0.563441)*sailStates.q + (-0.031648)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.491532)*sailStates.alpha + (0.243729)*sailStates.beta + (-1.406499)*sailStates.p + (11.772597)*sailStates.q + (-0.984408)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.398702)*sailStates.alpha + (-0.332851)*sailStates.beta + (9.421484)*sailStates.p + (-144.107040)*sailStates.q + (3.917396)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.039545)*sailStates.alpha + (0.013831)*sailStates.beta + (0.979397)*sailStates.p + (-4.532672)*sailStates.q + (0.005704)*sailStates.r + (-0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end