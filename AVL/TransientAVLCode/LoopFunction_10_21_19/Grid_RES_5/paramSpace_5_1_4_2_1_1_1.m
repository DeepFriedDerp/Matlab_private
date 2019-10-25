function [aeroForces] = paramSpace_5_1_4_2_1_1_1(sailStates,airStates)

	CL = (4.149290)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.368923)*sailStates.p + (34.276611)*sailStates.q + (-0.907361)*sailStates.r + (0.011160)*sailStates.de;
	CD = -0.079040;
	CY = (-0.038720)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.271599)*sailStates.p + (-0.493723)*sailStates.q + (-0.028598)*sailStates.r + (-0.000106)*sailStates.de;

	Cl = (1.138788)*sailStates.alpha + (0.155691)*sailStates.beta + (-1.037957)*sailStates.p + (8.453540)*sailStates.q + (-0.709157)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-14.195239)*sailStates.alpha + (0.000000)*sailStates.beta + (7.836573)*sailStates.p + (-131.315216)*sailStates.q + (3.041631)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (-0.068420)*sailStates.alpha + (0.016364)*sailStates.beta + (0.553700)*sailStates.p + (-1.991449)*sailStates.q + (-0.005054)*sailStates.r + (0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end