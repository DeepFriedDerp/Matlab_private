function [aeroForces] = paramSpace_4_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.186349)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.936617)*sailStates.p + (27.885414)*sailStates.q + (0.460982)*sailStates.r + (0.009902)*sailStates.de;
	CD = -0.450690;
	CY = (0.016608)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.307388)*sailStates.p + (0.696927)*sailStates.q + (0.043126)*sailStates.r + (0.000148)*sailStates.de;

	Cl = (0.882150)*sailStates.alpha + (-0.181643)*sailStates.beta + (-0.742648)*sailStates.p + (5.150267)*sailStates.q + (0.591499)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-14.696223)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.211242)*sailStates.p + (-121.395615)*sailStates.q + (-1.502335)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (0.472733)*sailStates.alpha + (-0.025528)*sailStates.beta + (-0.815592)*sailStates.p + (3.505087)*sailStates.q + (-0.016924)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end