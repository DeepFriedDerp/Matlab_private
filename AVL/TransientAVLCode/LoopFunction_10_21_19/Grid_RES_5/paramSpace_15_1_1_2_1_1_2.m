function [aeroForces] = paramSpace_15_1_1_2_1_1_2(sailStates,airStates)

	CL = (3.841757)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.568492)*sailStates.p + (34.892117)*sailStates.q + (0.859301)*sailStates.r + (0.010204)*sailStates.de;
	CD = 0.020540;
	CY = (-0.065104)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.098006)*sailStates.p + (-0.596614)*sailStates.q + (-0.024371)*sailStates.r + (-0.000126)*sailStates.de;

	Cl = (1.246590)*sailStates.alpha + (-0.025547)*sailStates.beta + (-1.278830)*sailStates.p + (11.017706)*sailStates.q + (0.462591)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-14.229500)*sailStates.alpha + (0.000000)*sailStates.beta + (8.751616)*sailStates.p + (-138.535995)*sailStates.q + (-2.881629)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (-0.186103)*sailStates.alpha + (0.006370)*sailStates.beta + (0.053234)*sailStates.p + (-0.732525)*sailStates.q + (-0.049538)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end