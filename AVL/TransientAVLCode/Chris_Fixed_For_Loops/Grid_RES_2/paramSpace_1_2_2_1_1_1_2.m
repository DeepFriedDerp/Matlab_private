function [aeroForces] = paramSpace_1_2_2_1_1_1_2(sailStates,airStates)

	CL = (5.269114)*sailStates.alpha + (-0.808261)*sailStates.beta + (-6.046246)*sailStates.p + (55.407955)*sailStates.q + (2.425581)*sailStates.r + (0.011144)*sailStates.de;
	CD = -7.862040;
	CY = (2.708242)*sailStates.alpha + (-0.019347)*sailStates.beta + (1.397238)*sailStates.p + (4.217611)*sailStates.q + (0.185145)*sailStates.r + (0.000958)*sailStates.de;

	Cl = (-1.400922)*sailStates.alpha + (-1.009364)*sailStates.beta + (-4.150462)*sailStates.p + (35.672287)*sailStates.q + (2.668205)*sailStates.r + (0.005434)*sailStates.de;
	Cm = (6.874772)*sailStates.alpha + (3.520516)*sailStates.beta + (22.602474)*sailStates.p + (-238.561264)*sailStates.q + (-8.304004)*sailStates.r + (-0.082319)*sailStates.de;
	Cn = (-10.091688)*sailStates.alpha + (-0.100142)*sailStates.beta + (-3.768238)*sailStates.p + (15.889112)*sailStates.q + (-0.077560)*sailStates.r + (-0.000852)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end