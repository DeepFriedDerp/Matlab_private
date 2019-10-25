function [aeroForces] = paramSpace_11_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.294557)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.355475)*sailStates.p + (34.374962)*sailStates.q + (1.128103)*sailStates.r + (0.011109)*sailStates.de;
	CD = -0.162700;
	CY = (-0.078980)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.417887)*sailStates.p + (-0.322048)*sailStates.q + (-0.043910)*sailStates.r + (-0.000069)*sailStates.de;

	Cl = (1.264807)*sailStates.alpha + (-0.195970)*sailStates.beta + (-1.029632)*sailStates.p + (8.477526)*sailStates.q + (0.906445)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.214849)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.681809)*sailStates.p + (-130.700150)*sailStates.q + (-3.794215)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (0.248151)*sailStates.alpha + (0.020597)*sailStates.beta + (-0.847043)*sailStates.p + (3.839439)*sailStates.q + (0.005089)*sailStates.r + (0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end