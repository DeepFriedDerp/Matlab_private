function [aeroForces] = paramSpace_3_3_3_2_1_3_3(sailStates,airStates)

	CL = (4.781437)*sailStates.alpha + (-0.117302)*sailStates.beta + (-2.987307)*sailStates.p + (39.486134)*sailStates.q + (1.601129)*sailStates.r + (0.011470)*sailStates.de;
	CD = -0.619500;
	CY = (0.004315)*sailStates.alpha + (-0.024635)*sailStates.beta + (0.700708)*sailStates.p + (-0.870358)*sailStates.q + (-0.045957)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.728502)*sailStates.alpha + (-0.350249)*sailStates.beta + (-1.523714)*sailStates.p + (12.966193)*sailStates.q + (1.391245)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.322453)*sailStates.alpha + (0.456032)*sailStates.beta + (9.785001)*sailStates.p + (-147.878265)*sailStates.q + (-5.425851)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.187708)*sailStates.alpha + (0.019836)*sailStates.beta + (-1.452093)*sailStates.p + (6.870486)*sailStates.q + (0.010534)*sailStates.r + (0.000376)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end