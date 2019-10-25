function [aeroForces] = paramSpace_2_1_3_2_1_3_1(sailStates,airStates)

	CL = (4.692762)*sailStates.alpha + (0.259330)*sailStates.beta + (-2.158592)*sailStates.p + (31.473167)*sailStates.q + (1.220122)*sailStates.r + (0.010777)*sailStates.de;
	CD = -0.591230;
	CY = (-0.199259)*sailStates.alpha + (-0.025025)*sailStates.beta + (0.622588)*sailStates.p + (-0.771085)*sailStates.q + (-0.000072)*sailStates.r + (-0.000164)*sailStates.de;

	Cl = (1.412858)*sailStates.alpha + (-0.207655)*sailStates.beta + (-0.920444)*sailStates.p + (7.206067)*sailStates.q + (1.139901)*sailStates.r + (-0.000069)*sailStates.de;
	Cm = (-14.823458)*sailStates.alpha + (-1.069352)*sailStates.beta + (7.425094)*sailStates.p + (-125.620300)*sailStates.q + (-4.166658)*sailStates.r + (-0.068473)*sailStates.de;
	Cn = (0.691400)*sailStates.alpha + (0.000351)*sailStates.beta + (-1.356104)*sailStates.p + (6.619235)*sailStates.q + (-0.000146)*sailStates.r + (0.000312)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end