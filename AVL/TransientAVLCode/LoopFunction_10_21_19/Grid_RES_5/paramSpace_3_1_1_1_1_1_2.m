function [aeroForces] = paramSpace_3_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.323107)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.110528)*sailStates.p + (43.415981)*sailStates.q + (-2.118016)*sailStates.r + (0.011707)*sailStates.de;
	CD = -0.612930;
	CY = (-0.241508)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.718490)*sailStates.p + (-0.624080)*sailStates.q + (-0.126622)*sailStates.r + (-0.000134)*sailStates.de;

	Cl = (1.285264)*sailStates.alpha + (0.384134)*sailStates.beta + (-1.624320)*sailStates.p + (14.803279)*sailStates.q + (-1.784849)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-11.363634)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.454494)*sailStates.p + (-150.579605)*sailStates.q + (7.114088)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (0.717920)*sailStates.alpha + (0.067733)*sailStates.beta + (1.381140)*sailStates.p + (-4.625493)*sailStates.q + (-0.021119)*sailStates.r + (0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end