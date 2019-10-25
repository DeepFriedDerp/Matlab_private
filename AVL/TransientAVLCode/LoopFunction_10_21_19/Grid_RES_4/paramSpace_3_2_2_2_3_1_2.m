function [aeroForces] = paramSpace_3_2_2_2_3_1_2(sailStates,airStates)

	CL = (4.685112)*sailStates.alpha + (-0.068260)*sailStates.beta + (-2.548195)*sailStates.p + (33.710560)*sailStates.q + (-0.880959)*sailStates.r + (0.010814)*sailStates.de;
	CD = -0.543490;
	CY = (0.093005)*sailStates.alpha + (-0.024729)*sailStates.beta + (-0.533120)*sailStates.p + (0.769434)*sailStates.q + (0.034915)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.553387)*sailStates.alpha + (0.216003)*sailStates.beta + (-1.220914)*sailStates.p + (9.655871)*sailStates.q + (-0.890586)*sailStates.r + (0.000405)*sailStates.de;
	Cm = (-15.530738)*sailStates.alpha + (0.278762)*sailStates.beta + (9.070819)*sailStates.p + (-137.556381)*sailStates.q + (2.986492)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.350488)*sailStates.alpha + (-0.016377)*sailStates.beta + (1.236511)*sailStates.p + (-6.379170)*sailStates.q + (-0.017435)*sailStates.r + (-0.000318)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end