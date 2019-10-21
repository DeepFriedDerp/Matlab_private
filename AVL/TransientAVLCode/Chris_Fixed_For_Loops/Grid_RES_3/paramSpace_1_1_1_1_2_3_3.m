function [aeroForces] = paramSpace_1_1_1_1_2_3_3(sailStates,airStates)

	CL = (0.460977)*sailStates.alpha + (0.065603)*sailStates.beta + (-5.823902)*sailStates.p + (57.398037)*sailStates.q + (0.144448)*sailStates.r + (0.011327)*sailStates.de;
	CD = -1.706430;
	CY = (0.963772)*sailStates.alpha + (-0.028265)*sailStates.beta + (0.453249)*sailStates.p + (2.386796)*sailStates.q + (0.079693)*sailStates.r + (0.000540)*sailStates.de;

	Cl = (-1.041427)*sailStates.alpha + (-0.335854)*sailStates.beta + (-3.998928)*sailStates.p + (35.498295)*sailStates.q + (0.462960)*sailStates.r + (0.005300)*sailStates.de;
	Cm = (2.845170)*sailStates.alpha + (-0.272674)*sailStates.beta + (20.949615)*sailStates.p + (-232.398880)*sailStates.q + (-0.354138)*sailStates.r + (-0.081278)*sailStates.de;
	Cn = (-3.652151)*sailStates.alpha + (-0.063972)*sailStates.beta + (-1.798953)*sailStates.p + (9.536479)*sailStates.q + (-0.111064)*sailStates.r + (-0.000433)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end