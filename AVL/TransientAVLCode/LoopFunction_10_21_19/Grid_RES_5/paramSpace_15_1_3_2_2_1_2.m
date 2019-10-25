function [aeroForces] = paramSpace_15_1_3_2_2_1_2(sailStates,airStates)

	CL = (3.728787)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.595427)*sailStates.p + (34.849358)*sailStates.q + (0.675382)*sailStates.r + (0.009995)*sailStates.de;
	CD = 0.021250;
	CY = (0.024258)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.001312)*sailStates.p + (0.199285)*sailStates.q + (-0.000320)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.234962)*sailStates.alpha + (-0.008488)*sailStates.beta + (-1.295844)*sailStates.p + (10.971720)*sailStates.q + (0.343789)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-13.832049)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.064765)*sailStates.p + (-139.959488)*sailStates.q + (-2.345542)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (-0.294352)*sailStates.alpha + (0.002116)*sailStates.beta + (0.278289)*sailStates.p + (-2.536697)*sailStates.q + (-0.074576)*sailStates.r + (-0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end