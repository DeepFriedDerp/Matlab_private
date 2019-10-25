function [aeroForces] = paramSpace_1_1_3_1_3_1_3(sailStates,airStates)

	CL = (7.506810)*sailStates.alpha + (-0.690737)*sailStates.beta + (-3.454607)*sailStates.p + (49.492954)*sailStates.q + (-3.842156)*sailStates.r + (0.012565)*sailStates.de;
	CD = -3.071790;
	CY = (-0.247958)*sailStates.alpha + (-0.029968)*sailStates.beta + (-1.574378)*sailStates.p + (2.260756)*sailStates.q + (-0.277390)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (3.213658)*sailStates.alpha + (0.462157)*sailStates.beta + (-1.935160)*sailStates.p + (19.020510)*sailStates.q + (-3.264597)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-12.613699)*sailStates.alpha + (2.512001)*sailStates.beta + (9.252607)*sailStates.p + (-156.476898)*sailStates.q + (12.720823)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (1.923799)*sailStates.alpha + (0.131805)*sailStates.beta + (3.215697)*sailStates.p + (-15.014266)*sailStates.q + (0.051072)*sailStates.r + (-0.000980)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end