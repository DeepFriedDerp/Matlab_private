function [aeroForces] = paramSpace_4_1_4_1_2_3_2(sailStates,airStates)

	CL = (6.450176)*sailStates.alpha + (0.758505)*sailStates.beta + (-2.630156)*sailStates.p + (43.018047)*sailStates.q + (3.243847)*sailStates.r + (0.011903)*sailStates.de;
	CD = -2.409690;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (1.273548)*sailStates.p + (-0.000001)*sailStates.q + (-0.253324)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.990145)*sailStates.alpha + (-0.418207)*sailStates.beta + (-1.254675)*sailStates.p + (12.522905)*sailStates.q + (2.805067)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-10.165426)*sailStates.alpha + (-2.930546)*sailStates.beta + (6.622295)*sailStates.p + (-133.820877)*sailStates.q + (-10.764605)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.036093)*sailStates.alpha + (0.132284)*sailStates.beta + (-2.677400)*sailStates.p + (11.102641)*sailStates.q + (0.023879)*sailStates.r + (0.000206)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end