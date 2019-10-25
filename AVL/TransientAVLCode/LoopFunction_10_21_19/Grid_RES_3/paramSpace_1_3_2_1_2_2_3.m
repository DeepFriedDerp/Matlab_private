function [aeroForces] = paramSpace_1_3_2_1_2_2_3(sailStates,airStates)

	CL = (3.522555)*sailStates.alpha + (0.199764)*sailStates.beta + (-3.345579)*sailStates.p + (42.246021)*sailStates.q + (-1.180590)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.075380;
	CY = (-0.034402)*sailStates.alpha + (-0.023346)*sailStates.beta + (-0.291020)*sailStates.p + (0.589408)*sailStates.q + (-0.051315)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.270496)*sailStates.alpha + (0.195778)*sailStates.beta + (-1.829371)*sailStates.p + (16.020660)*sailStates.q + (-0.843247)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-12.614661)*sailStates.alpha + (-0.711401)*sailStates.beta + (11.059381)*sailStates.p + (-158.590927)*sailStates.q + (3.963539)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (0.440673)*sailStates.alpha + (0.024241)*sailStates.beta + (0.350555)*sailStates.p + (-0.853535)*sailStates.q + (-0.029997)*sailStates.r + (-0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end