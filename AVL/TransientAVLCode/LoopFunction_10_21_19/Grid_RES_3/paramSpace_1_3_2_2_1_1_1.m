function [aeroForces] = paramSpace_1_3_2_2_1_1_1(sailStates,airStates)

	CL = (4.222528)*sailStates.alpha + (0.331929)*sailStates.beta + (-2.183934)*sailStates.p + (34.806789)*sailStates.q + (-1.559806)*sailStates.r + (0.011055)*sailStates.de;
	CD = -0.364690;
	CY = (-0.049209)*sailStates.alpha + (-0.027419)*sailStates.beta + (-0.503665)*sailStates.p + (-1.027330)*sailStates.q + (-0.088810)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (0.905215)*sailStates.alpha + (0.375882)*sailStates.beta + (-0.838223)*sailStates.p + (7.042597)*sailStates.q + (-1.266473)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-12.135441)*sailStates.alpha + (-1.258332)*sailStates.beta + (6.623743)*sailStates.p + (-124.672363)*sailStates.q + (5.221412)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (-0.346897)*sailStates.alpha + (0.051811)*sailStates.beta + (1.060489)*sailStates.p + (-3.706707)*sailStates.q + (-0.010259)*sailStates.r + (0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end