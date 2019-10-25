function [aeroForces] = paramSpace_1_1_2_2_1_1_1(sailStates,airStates)

	CL = (3.895247)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.293333)*sailStates.p + (36.058922)*sailStates.q + (-1.567723)*sailStates.r + (0.010727)*sailStates.de;
	CD = -0.054460;
	CY = (-0.038745)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.432184)*sailStates.p + (-0.596615)*sailStates.q + (-0.107734)*sailStates.r + (-0.000125)*sailStates.de;

	Cl = (1.066836)*sailStates.alpha + (0.239537)*sailStates.beta + (-0.996009)*sailStates.p + (8.957872)*sailStates.q + (-1.187991)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-11.971512)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.910160)*sailStates.p + (-128.528122)*sailStates.q + (5.206042)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (-0.037116)*sailStates.alpha + (0.059723)*sailStates.beta + (0.804549)*sailStates.p + (-2.393789)*sailStates.q + (-0.033754)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end