function [aeroForces] = paramSpace_1_3_1_2_1_3_1(sailStates,airStates)

	CL = (4.230162)*sailStates.alpha + (-0.065629)*sailStates.beta + (-2.045254)*sailStates.p + (28.451212)*sailStates.q + (0.468956)*sailStates.r + (0.009692)*sailStates.de;
	CD = -0.420670;
	CY = (-0.188636)*sailStates.alpha + (-0.027673)*sailStates.beta + (0.418333)*sailStates.p + (-1.027328)*sailStates.q + (0.073861)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.100200)*sailStates.alpha + (-0.200228)*sailStates.beta + (-0.794212)*sailStates.p + (5.352144)*sailStates.q + (0.597719)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-15.096336)*sailStates.alpha + (0.205753)*sailStates.beta + (7.803548)*sailStates.p + (-124.672363)*sailStates.q + (-1.469602)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.710011)*sailStates.alpha + (-0.021212)*sailStates.beta + (-1.045488)*sailStates.p + (5.880330)*sailStates.q + (-0.054575)*sailStates.r + (0.000385)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end