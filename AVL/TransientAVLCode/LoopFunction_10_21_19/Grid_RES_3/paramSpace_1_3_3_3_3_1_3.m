function [aeroForces] = paramSpace_1_3_3_3_3_1_3(sailStates,airStates)

	CL = (4.316104)*sailStates.alpha + (0.299981)*sailStates.beta + (-2.771300)*sailStates.p + (39.221790)*sailStates.q + (-1.738343)*sailStates.r + (0.011245)*sailStates.de;
	CD = -0.253610;
	CY = (0.023851)*sailStates.alpha + (-0.023320)*sailStates.beta + (-0.587976)*sailStates.p + (0.665002)*sailStates.q + (-0.103613)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.449839)*sailStates.alpha + (0.366645)*sailStates.beta + (-1.338267)*sailStates.p + (11.837944)*sailStates.q + (-1.351323)*sailStates.r + (0.000521)*sailStates.de;
	Cm = (-13.294497)*sailStates.alpha + (-1.039989)*sailStates.beta + (8.560851)*sailStates.p + (-141.044128)*sailStates.q + (5.770516)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.128663)*sailStates.alpha + (0.045222)*sailStates.beta + (1.125900)*sailStates.p + (-4.948682)*sailStates.q + (0.001559)*sailStates.r + (-0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end