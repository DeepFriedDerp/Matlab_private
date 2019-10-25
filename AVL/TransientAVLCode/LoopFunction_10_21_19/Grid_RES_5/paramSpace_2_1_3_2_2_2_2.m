function [aeroForces] = paramSpace_2_1_3_2_2_2_2(sailStates,airStates)

	CL = (3.882018)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.618487)*sailStates.p + (35.126732)*sailStates.q + (-0.691885)*sailStates.r + (0.010336)*sailStates.de;
	CD = 0.010380;
	CY = (0.064427)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.070567)*sailStates.p + (0.571905)*sailStates.q + (-0.014979)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.270987)*sailStates.alpha + (0.012623)*sailStates.beta + (-1.304302)*sailStates.p + (11.047540)*sailStates.q + (-0.361358)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-14.292459)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.986251)*sailStates.p + (-139.762878)*sailStates.q + (2.338523)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (0.162129)*sailStates.alpha + (0.002683)*sailStates.beta + (-0.092593)*sailStates.p + (0.858987)*sailStates.q + (-0.037636)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end