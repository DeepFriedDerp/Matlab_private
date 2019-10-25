function [aeroForces] = paramSpace_1_2_1_1_3_3_1(sailStates,airStates)

	CL = (4.704860)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.446442)*sailStates.p + (21.242153)*sailStates.q + (1.231361)*sailStates.r + (0.008872)*sailStates.de;
	CD = -1.565070;
	CY = (-0.124441)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.646196)*sailStates.p + (1.081943)*sailStates.q + (0.113839)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (0.423511)*sailStates.alpha + (-0.366247)*sailStates.beta + (-0.393917)*sailStates.p + (1.374379)*sailStates.q + (1.349241)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-14.534739)*sailStates.alpha + (0.000000)*sailStates.beta + (6.308977)*sailStates.p + (-109.437057)*sailStates.q + (-4.034419)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (1.348312)*sailStates.alpha + (-0.064579)*sailStates.beta + (-1.560008)*sailStates.p + (6.311345)*sailStates.q + (-0.024878)*sailStates.r + (-0.000184)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end