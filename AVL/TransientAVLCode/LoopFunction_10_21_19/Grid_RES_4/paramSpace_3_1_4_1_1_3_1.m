function [aeroForces] = paramSpace_3_1_4_1_1_3_1(sailStates,airStates)

	CL = (7.287280)*sailStates.alpha + (0.664407)*sailStates.beta + (-1.703120)*sailStates.p + (30.312063)*sailStates.q + (2.890240)*sailStates.r + (0.010963)*sailStates.de;
	CD = -2.984070;
	CY = (-0.704913)*sailStates.alpha + (-0.026822)*sailStates.beta + (1.384835)*sailStates.p + (-1.471504)*sailStates.q + (-0.090922)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (2.300837)*sailStates.alpha + (-0.443078)*sailStates.beta + (-0.532577)*sailStates.p + (4.342807)*sailStates.q + (2.610224)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.734664)*sailStates.alpha + (-2.639289)*sailStates.beta + (5.044446)*sailStates.p + (-111.058342)*sailStates.q + (-9.803280)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (2.577688)*sailStates.alpha + (0.047742)*sailStates.beta + (-3.023852)*sailStates.p + (14.663586)*sailStates.q + (0.029272)*sailStates.r + (0.000612)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end