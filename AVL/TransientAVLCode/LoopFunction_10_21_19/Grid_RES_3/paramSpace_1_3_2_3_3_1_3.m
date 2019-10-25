function [aeroForces] = paramSpace_1_3_2_3_3_1_3(sailStates,airStates)

	CL = (4.286193)*sailStates.alpha + (0.325243)*sailStates.beta + (-2.770343)*sailStates.p + (39.279621)*sailStates.q + (-1.750350)*sailStates.r + (0.011140)*sailStates.de;
	CD = -0.256610;
	CY = (0.021703)*sailStates.alpha + (-0.023155)*sailStates.beta + (-0.607378)*sailStates.p + (0.665001)*sailStates.q + (-0.107097)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.452379)*sailStates.alpha + (0.377336)*sailStates.beta + (-1.337823)*sailStates.p + (11.840568)*sailStates.q + (-1.382888)*sailStates.r + (0.000521)*sailStates.de;
	Cm = (-13.060472)*sailStates.alpha + (-1.198419)*sailStates.beta + (8.548793)*sailStates.p + (-141.044128)*sailStates.q + (5.838898)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.136092)*sailStates.alpha + (0.046698)*sailStates.beta + (1.154974)*sailStates.p + (-4.963562)*sailStates.q + (0.001407)*sailStates.r + (-0.000289)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end