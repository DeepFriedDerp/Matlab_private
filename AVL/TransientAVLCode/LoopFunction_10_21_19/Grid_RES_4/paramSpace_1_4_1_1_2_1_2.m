function [aeroForces] = paramSpace_1_4_1_1_2_1_2(sailStates,airStates)

	CL = (6.450176)*sailStates.alpha + (0.758505)*sailStates.beta + (-2.630156)*sailStates.p + (43.018040)*sailStates.q + (-3.243846)*sailStates.r + (0.011903)*sailStates.de;
	CD = -2.409690;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.273548)*sailStates.p + (0.000001)*sailStates.q + (-0.253324)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.879408)*sailStates.alpha + (0.840295)*sailStates.beta + (-1.160318)*sailStates.p + (11.335025)*sailStates.q + (-2.786170)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-10.165428)*sailStates.alpha + (-2.930546)*sailStates.beta + (6.622296)*sailStates.p + (-133.820877)*sailStates.q + (10.764606)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.230928)*sailStates.alpha + (0.118048)*sailStates.beta + (2.696168)*sailStates.p + (-11.338925)*sailStates.q + (0.027638)*sailStates.r + (-0.000206)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end