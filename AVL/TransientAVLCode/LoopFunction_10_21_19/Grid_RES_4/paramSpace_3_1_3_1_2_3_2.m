function [aeroForces] = paramSpace_3_1_3_1_2_3_2(sailStates,airStates)

	CL = (6.439509)*sailStates.alpha + (0.598065)*sailStates.beta + (-2.604981)*sailStates.p + (37.370300)*sailStates.q + (2.557426)*sailStates.r + (0.011390)*sailStates.de;
	CD = -2.349990;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (1.132453)*sailStates.p + (-0.000001)*sailStates.q + (-0.074225)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.966613)*sailStates.alpha + (-0.393949)*sailStates.beta + (-1.265972)*sailStates.p + (11.018858)*sailStates.q + (2.321092)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-13.422435)*sailStates.alpha + (-2.351546)*sailStates.beta + (8.194676)*sailStates.p + (-136.150452)*sailStates.q + (-8.678736)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.236938)*sailStates.alpha + (0.039907)*sailStates.beta + (-2.466444)*sailStates.p + (10.908335)*sailStates.q + (0.014904)*sailStates.r + (0.000202)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end