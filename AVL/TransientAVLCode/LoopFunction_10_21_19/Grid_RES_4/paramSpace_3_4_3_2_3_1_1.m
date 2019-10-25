function [aeroForces] = paramSpace_3_4_3_2_3_1_1(sailStates,airStates)

	CL = (4.545500)*sailStates.alpha + (0.190702)*sailStates.beta + (-2.126235)*sailStates.p + (30.202263)*sailStates.q + (-0.927904)*sailStates.r + (0.010434)*sailStates.de;
	CD = -0.532530;
	CY = (0.193646)*sailStates.alpha + (-0.025807)*sailStates.beta + (-0.535144)*sailStates.p + (0.870359)*sailStates.q + (0.035106)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (1.194441)*sailStates.alpha + (0.293588)*sailStates.beta + (-0.817877)*sailStates.p + (5.727064)*sailStates.q + (-0.916018)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-15.131754)*sailStates.alpha + (-0.724375)*sailStates.beta + (7.658310)*sailStates.p + (-125.466835)*sailStates.q + (3.123312)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.739492)*sailStates.alpha + (-0.012023)*sailStates.beta + (1.222984)*sailStates.p + (-6.343412)*sailStates.q + (-0.016665)*sailStates.r + (-0.000347)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end