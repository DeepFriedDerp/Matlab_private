function [aeroForces] = paramSpace_4_3_2_1_3_2_1(sailStates,airStates)

	CL = (3.661934)*sailStates.alpha + (-0.029818)*sailStates.beta + (-1.677295)*sailStates.p + (27.719332)*sailStates.q + (0.213721)*sailStates.r + (0.010297)*sailStates.de;
	CD = 0.023440;
	CY = (0.336435)*sailStates.alpha + (-0.027370)*sailStates.beta + (-0.155192)*sailStates.p + (2.326708)*sailStates.q + (0.030786)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (0.581100)*sailStates.alpha + (-0.015898)*sailStates.beta + (-0.478471)*sailStates.p + (2.883431)*sailStates.q + (0.032341)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-13.581348)*sailStates.alpha + (0.107585)*sailStates.beta + (5.993454)*sailStates.p + (-113.341965)*sailStates.q + (-0.777384)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-0.482879)*sailStates.alpha + (0.005880)*sailStates.beta + (0.337612)*sailStates.p + (-3.246086)*sailStates.q + (-0.054566)*sailStates.r + (-0.000682)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end