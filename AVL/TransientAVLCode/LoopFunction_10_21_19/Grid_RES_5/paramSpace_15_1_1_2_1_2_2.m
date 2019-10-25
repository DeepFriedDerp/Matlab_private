function [aeroForces] = paramSpace_15_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.175618)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.669317)*sailStates.p + (39.645412)*sailStates.q + (1.956185)*sailStates.r + (0.011139)*sailStates.de;
	CD = -0.153210;
	CY = (-0.026877)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.591391)*sailStates.p + (-0.596613)*sailStates.q + (-0.147386)*sailStates.r + (-0.000126)*sailStates.de;

	Cl = (1.432148)*sailStates.alpha + (-0.272240)*sailStates.beta + (-1.310707)*sailStates.p + (12.272676)*sailStates.q + (1.474648)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-12.639555)*sailStates.alpha + (0.000000)*sailStates.beta + (7.869195)*sailStates.p + (-138.535995)*sailStates.q + (-6.420828)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (-0.203058)*sailStates.alpha + (0.067877)*sailStates.beta + (-1.078713)*sailStates.p + (4.300881)*sailStates.q + (-0.017615)*sailStates.r + (0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end