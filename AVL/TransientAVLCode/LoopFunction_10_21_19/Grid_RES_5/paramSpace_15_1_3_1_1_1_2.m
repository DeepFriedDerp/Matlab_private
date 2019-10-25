function [aeroForces] = paramSpace_15_1_3_1_1_1_2(sailStates,airStates)

	CL = (3.960886)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.755593)*sailStates.p + (34.281101)*sailStates.q + (0.397049)*sailStates.r + (0.009478)*sailStates.de;
	CD = -0.325540;
	CY = (-0.188175)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.085689)*sailStates.p + (-1.423509)*sailStates.q + (0.021313)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (1.298329)*sailStates.alpha + (0.098785)*sailStates.beta + (-1.472946)*sailStates.p + (12.450898)*sailStates.q + (0.038720)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-14.354830)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.984908)*sailStates.p + (-145.460434)*sailStates.q + (-1.437040)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.068484)*sailStates.alpha + (-0.024630)*sailStates.beta + (0.574772)*sailStates.p + (-2.863551)*sailStates.q + (-0.061326)*sailStates.r + (0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end