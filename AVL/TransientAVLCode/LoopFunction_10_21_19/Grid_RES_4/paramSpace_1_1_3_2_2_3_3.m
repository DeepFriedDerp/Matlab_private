function [aeroForces] = paramSpace_1_1_3_2_2_3_3(sailStates,airStates)

	CL = (4.044585)*sailStates.alpha + (0.021940)*sailStates.beta + (-2.771911)*sailStates.p + (34.689606)*sailStates.q + (-0.107548)*sailStates.r + (0.010001)*sailStates.de;
	CD = -0.298470;
	CY = (0.071236)*sailStates.alpha + (-0.025713)*sailStates.beta + (0.208080)*sailStates.p + (0.301044)*sailStates.q + (0.041401)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.422132)*sailStates.alpha + (-0.127580)*sailStates.beta + (-1.495228)*sailStates.p + (12.535963)*sailStates.q + (0.151150)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-14.576955)*sailStates.alpha + (-0.166444)*sailStates.beta + (10.034451)*sailStates.p + (-144.677322)*sailStates.q + (0.418894)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.129312)*sailStates.alpha + (-0.031432)*sailStates.beta + (-0.744010)*sailStates.p + (4.150548)*sailStates.q + (-0.058834)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end