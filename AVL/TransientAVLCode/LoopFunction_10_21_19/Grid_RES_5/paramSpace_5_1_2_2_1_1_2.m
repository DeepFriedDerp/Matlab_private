function [aeroForces] = paramSpace_5_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.107477)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.793133)*sailStates.p + (37.806923)*sailStates.q + (-1.014216)*sailStates.r + (0.011271)*sailStates.de;
	CD = -0.086670;
	CY = (-0.070644)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.328989)*sailStates.p + (-0.322046)*sailStates.q + (-0.034567)*sailStates.r + (-0.000070)*sailStates.de;

	Cl = (1.317305)*sailStates.alpha + (0.177467)*sailStates.beta + (-1.385064)*sailStates.p + (11.703918)*sailStates.q + (-0.830019)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-13.917786)*sailStates.alpha + (0.000000)*sailStates.beta + (9.236098)*sailStates.p + (-143.031982)*sailStates.q + (3.440056)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (0.164817)*sailStates.alpha + (0.018653)*sailStates.beta + (0.618167)*sailStates.p + (-2.060123)*sailStates.q + (-0.007020)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end