function [aeroForces] = paramSpace_1_1_1_1_2_1_1(sailStates,airStates)

	CL = (4.821055)*sailStates.alpha + (0.054431)*sailStates.beta + (-2.513522)*sailStates.p + (32.795586)*sailStates.q + (-0.542819)*sailStates.r + (0.009777)*sailStates.de;
	CD = -0.697880;
	CY = (0.908350)*sailStates.alpha + (-0.042113)*sailStates.beta + (-0.382716)*sailStates.p + (7.407443)*sailStates.q + (-0.050910)*sailStates.r + (0.001575)*sailStates.de;

	Cl = (1.264616)*sailStates.alpha + (-0.143949)*sailStates.beta + (-1.311551)*sailStates.p + (11.246819)*sailStates.q + (-0.143124)*sailStates.r + (0.000467)*sailStates.de;
	Cm = (-15.428376)*sailStates.alpha + (-0.333769)*sailStates.beta + (8.542766)*sailStates.p + (-135.362640)*sailStates.q + (1.758578)*sailStates.r + (-0.068126)*sailStates.de;
	Cn = (-0.782270)*sailStates.alpha + (0.001235)*sailStates.beta + (0.469160)*sailStates.p + (-6.948254)*sailStates.q + (0.066377)*sailStates.r + (-0.002113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end