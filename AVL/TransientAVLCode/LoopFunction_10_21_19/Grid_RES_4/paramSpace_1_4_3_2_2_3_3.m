function [aeroForces] = paramSpace_1_4_3_2_2_3_3(sailStates,airStates)

	CL = (4.044585)*sailStates.alpha + (-0.021940)*sailStates.beta + (-2.771911)*sailStates.p + (34.689606)*sailStates.q + (-0.107548)*sailStates.r + (0.010001)*sailStates.de;
	CD = -0.298470;
	CY = (0.071236)*sailStates.alpha + (-0.023859)*sailStates.beta + (0.208080)*sailStates.p + (0.301044)*sailStates.q + (0.041401)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.287258)*sailStates.alpha + (-0.106094)*sailStates.beta + (-1.400839)*sailStates.p + (11.348080)*sailStates.q + (0.169883)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-14.576955)*sailStates.alpha + (0.166444)*sailStates.beta + (10.034451)*sailStates.p + (-144.677322)*sailStates.q + (0.418894)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.133964)*sailStates.alpha + (-0.015049)*sailStates.beta + (-0.725235)*sailStates.p + (3.914263)*sailStates.q + (-0.055107)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end