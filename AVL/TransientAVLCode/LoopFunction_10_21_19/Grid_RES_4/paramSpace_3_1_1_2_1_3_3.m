function [aeroForces] = paramSpace_3_1_1_2_1_3_3(sailStates,airStates)

	CL = (4.711320)*sailStates.alpha + (0.306771)*sailStates.beta + (-2.968342)*sailStates.p + (39.186806)*sailStates.q + (1.579852)*sailStates.r + (0.011360)*sailStates.de;
	CD = -0.593700;
	CY = (0.000053)*sailStates.alpha + (-0.025439)*sailStates.beta + (0.670159)*sailStates.p + (-0.870358)*sailStates.q + (-0.043833)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.785875)*sailStates.alpha + (-0.193350)*sailStates.beta + (-1.579965)*sailStates.p + (13.696433)*sailStates.q + (1.345346)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.230721)*sailStates.alpha + (-1.087525)*sailStates.beta + (9.725456)*sailStates.p + (-146.834122)*sailStates.q + (-5.308928)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.229594)*sailStates.alpha + (0.021216)*sailStates.beta + (-1.402781)*sailStates.p + (6.793024)*sailStates.q + (0.010175)*sailStates.r + (0.000398)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end