function [aeroForces] = paramSpace_1_3_3_3_1_2_1(sailStates,airStates)

	CL = (3.867580)*sailStates.alpha + (0.110974)*sailStates.beta + (-2.246631)*sailStates.p + (32.744396)*sailStates.q + (-0.647249)*sailStates.r + (0.010590)*sailStates.de;
	CD = 0.052110;
	CY = (-0.074520)*sailStates.alpha + (-0.026342)*sailStates.beta + (-0.071610)*sailStates.p + (-0.665000)*sailStates.q + (-0.012690)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (0.979147)*sailStates.alpha + (0.095704)*sailStates.beta + (-0.925512)*sailStates.p + (7.285755)*sailStates.q + (-0.384635)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-14.006320)*sailStates.alpha + (-0.339589)*sailStates.beta + (7.597560)*sailStates.p + (-128.181442)*sailStates.q + (2.171019)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (0.122979)*sailStates.alpha + (0.014112)*sailStates.beta + (0.065202)*sailStates.p + (0.477202)*sailStates.q + (-0.027682)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end