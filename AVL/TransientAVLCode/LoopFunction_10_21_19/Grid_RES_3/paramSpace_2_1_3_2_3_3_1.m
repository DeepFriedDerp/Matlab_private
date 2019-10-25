function [aeroForces] = paramSpace_2_1_3_2_3_3_1(sailStates,airStates)

	CL = (4.287957)*sailStates.alpha + (0.209547)*sailStates.beta + (-2.158592)*sailStates.p + (31.473167)*sailStates.q + (0.816282)*sailStates.r + (0.010777)*sailStates.de;
	CD = -0.355650;
	CY = (0.033727)*sailStates.alpha + (-0.024637)*sailStates.beta + (0.372725)*sailStates.p + (0.771085)*sailStates.q + (0.000072)*sailStates.r + (0.000164)*sailStates.de;

	Cl = (1.067915)*sailStates.alpha + (-0.169053)*sailStates.beta + (-0.920444)*sailStates.p + (7.206067)*sailStates.q + (0.810204)*sailStates.r + (-0.000069)*sailStates.de;
	Cm = (-14.243431)*sailStates.alpha + (-0.898804)*sailStates.beta + (7.425094)*sailStates.p + (-125.620300)*sailStates.q + (-2.813205)*sailStates.r + (-0.068473)*sailStates.de;
	Cn = (0.302188)*sailStates.alpha + (-0.000219)*sailStates.beta + (-0.844734)*sailStates.p + (3.162076)*sailStates.q + (-0.000359)*sailStates.r + (-0.000165)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end